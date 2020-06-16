// MAIN PANEL
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;

import java.time.LocalDate;
import java.time.LocalTime;

public class MainPanel extends JPanel {
	private String fname, lname;
	private int recid;
	private JLabel greeting, checkin;
	private JTextField check;
	private JButton getclasses, newmemb, cancmemb;
	private String url;

	public MainPanel(String fn, String ln, int rec, String u) {
		fname = fn;
		lname = ln;
		recid = rec;
		url = u;

		setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));

		greeting = new JLabel("Welcome, " + fname + " " + lname);
		greeting.setAlignmentX(CENTER_ALIGNMENT);
		greeting.setVerticalTextPosition(SwingConstants.TOP);

		checkin = new JLabel("Enter MemberID to check in: ");
		checkin.setAlignmentX(CENTER_ALIGNMENT);

		check = new JTextField(5);

		check.addActionListener(new CheckListener());

		getclasses = new JButton("See Classes");
		getclasses.setAlignmentX(CENTER_ALIGNMENT);
		getclasses.addActionListener(new ClassListener());

		newmemb = new JButton("Start a Membership");
		newmemb.setAlignmentX(CENTER_ALIGNMENT);
		newmemb.addActionListener(new MembListener());

		cancmemb = new JButton("Cancel a Membership");
		cancmemb.setAlignmentX(CENTER_ALIGNMENT);
		cancmemb.addActionListener(new CancListener());

		add(greeting);
		add(checkin);
		add(check);
		add(Box.createVerticalGlue());
		add(getclasses);
		add(newmemb);
		add(cancmemb);

		setBackground(Color.gray);
	}

	private class MembListener implements ActionListener { // Start a Membership button
		public void actionPerformed(ActionEvent e) {
			GymPOS.membership();
		}
	}

	private class CancListener implements ActionListener { // Cancel a Membership button
		public void actionPerformed(ActionEvent e) {
			String numstr;
			int num, inst;
			Connection conn = null;

			numstr = JOptionPane.showInputDialog("Enter a MemberID: ");

			if (!numstr.isEmpty()) {
				num = Integer.parseInt(numstr);

				try {
					conn = DriverManager.getConnection(url);
					Statement stmt = conn.createStatement();
					String SQL = "SELECT memberid FROM member";
					ResultSet rs = stmt.executeQuery(SQL);
					boolean match = false;

					// Checks for match
					while ((rs.next()) && (match == false)) {
						inst = rs.getInt("memberid");
						if (num == inst)
							match = true;
					}

					if (match == true) {
						SQL = "DELETE FROM member WHERE memberid = " + num;
						stmt.execute(SQL);
						JOptionPane.showMessageDialog(null, "Membership successfully cancelled.");
					} else
						JOptionPane.showMessageDialog(null, "Invalid MemberID");

					conn.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}
	}

	private class ClassListener implements ActionListener { // See Classes button
		public void actionPerformed(ActionEvent e) {
			Connection conn = null;
			ResultSet results;

			try {
				conn = DriverManager.getConnection(url);
				Statement stmt = conn.createStatement();
				String SQL = "SELECT c.name AS cname, t.name AS tname, c.daysheld, c.timeheld, c.location, tr.fname, tr.lname\r\n"
						+ "FROM class c, exercisetype t, trainer tr\r\n"
						+ "WHERE c.typeid = t.typeid AND c.trainerid = tr.trainerid";
				results = stmt.executeQuery(SQL);
				String resultstring = null;

				while (results.next()) {

					if (resultstring == null)
						resultstring = results.getString("cname") + " | " + results.getString("tname") + " | "
								+ results.getString("daysheld") + " | " + results.getString("timeheld") + " | "
								+ results.getString("location") + " | " + results.getString("fname") + " "
								+ results.getString("lname") + "\n";
					else
						resultstring += results.getString("cname") + " | " + results.getString("tname") + " | "
								+ results.getString("daysheld") + " | " + results.getString("timeheld") + " | "
								+ results.getString("location") + " | " + results.getString("fname") + " "
								+ results.getString("lname") + "\n";

				}

				JOptionPane.showMessageDialog(null, resultstring);
				conn.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}

		}
	}

	private class CheckListener implements ActionListener { // Checking in a member
		public void actionPerformed(ActionEvent e) {
			int checkint, inst;
			checkint = Integer.parseInt(check.getText());
			Connection conn = null;
			boolean isIt = false;
			ResultSet possible;

			try {
				conn = DriverManager.getConnection(url);
				Statement stmt = conn.createStatement();
				String SQL = "SELECT memberid FROM member";
				possible = stmt.executeQuery(SQL);
				isIt = false;
				
				// checks for a match
				while ((possible.next()) && (isIt == false)) {
					inst = possible.getInt("memberid");
					if (checkint == inst) {
						isIt = true;
					}
				}
				
				// executes query if there is a match
				if (isIt == true) {
					SQL = "INSERT INTO checksin VALUES(" + checkint + ", '" + LocalDate.now() + "', '" + LocalTime.now()
							+ "', " + recid + ");";
					stmt.execute(SQL);
					JOptionPane.showMessageDialog(null, "Member successfully checked in.");
				} else
					JOptionPane.showMessageDialog(null, "Invalid MemberID");
				
				conn.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}

		}
	}

}
