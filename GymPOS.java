// DRIVER CLASS
import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.time.LocalDate;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class GymPOS {
	// driver class variables
	
	// CONNECTION URL (typically using port 1433)
	private static String url = "jdbc:sqlserver://localhost:1433;databaseName=Weber_Final;integratedSecurity=true;";
	
	public static JFrame frame = new JFrame("Gym Check-In PoS");
	public static JFrame nextframe;

	private static String first, last;
	private static int recid;

	private static JTextField fname, lname, dob, platend, trainer, referred;
	private static JRadioButton onemon, threemon, sixmon, oneyr;
	private static JButton enter, exit;



	public static void main(String[] args) {
		Connection conn = null;

		try {
			conn = DriverManager.getConnection(url);

			frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

			GymPanel panel = new GymPanel(url);

			frame.getContentPane().add(panel);
			frame.pack();
			frame.setVisible(true);

			// END TRY BLOCK
		} catch (SQLException e) {
			System.out.println("Could not connect to the server.");
			throw new Error("Problem", e);
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException ex) {
				System.out.println(ex.getMessage());
			}
		}

	}

	public static void nextPanel(String fn, String ln, int rec) { // sets up MainPanel

		first = fn;
		last = ln;
		recid = rec;

		frame.dispose();
		nextframe = new JFrame("Gym Check-In PoS");
		nextframe.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		MainPanel mp = new MainPanel(fn, ln, rec, url);

		nextframe.getContentPane().add(mp);
		nextframe.pack();
		nextframe.setVisible(true);
	}

	public static void membership() { // Start a Membership panel
		nextframe.dispose();
		frame.getContentPane().removeAll();
		frame.repaint();

		// PANEL CREATION

		JLabel lfname, llname, llength, ldob, lplatend, ltrainer, lreferred;

		lfname = new JLabel("First Name:");
		llname = new JLabel("Last Name: ");
		llength = new JLabel("Membership Length:");
		ldob = new JLabel("Date of Birth:");
		lplatend = new JLabel("Platinum End Date:");
		ltrainer = new JLabel("Trainer ID:");
		lreferred = new JLabel("MemberID referred by: ");

		fname = new JTextField(5);
		lname = new JTextField(5);
		dob = new JTextField(5);
		platend = new JTextField(5);
		trainer = new JTextField(5);
		referred = new JTextField(5);

		enter = new JButton("Enter");
		enter.addActionListener(new EnterListener());
		exit = new JButton("Exit");
		exit.addActionListener(new ExitListener());

		onemon = new JRadioButton("1 Month", true);
		threemon = new JRadioButton("3 Months");
		sixmon = new JRadioButton("6 Months");
		oneyr = new JRadioButton("1 Year");
		ButtonGroup group = new ButtonGroup();
		group.add(onemon);
		group.add(threemon);
		group.add(sixmon);
		group.add(oneyr);

		Box bx1 = Box.createHorizontalBox();
		bx1.add(lfname);
		bx1.add(fname);

		Box bx2 = Box.createHorizontalBox();
		bx2.add(llname);
		bx2.add(lname);

		Box bx3 = Box.createHorizontalBox();
		bx3.add(llength);
		bx3.add(onemon);
		bx3.add(threemon);
		bx3.add(sixmon);
		bx3.add(oneyr);

		Box bx4 = Box.createHorizontalBox();
		bx4.add(ldob);
		bx4.add(dob);

		Box bx5 = Box.createHorizontalBox();
		bx5.add(lplatend);
		bx5.add(platend);

		Box bx6 = Box.createHorizontalBox();
		bx6.add(ltrainer);
		bx6.add(trainer);

		Box bx7 = Box.createHorizontalBox();
		bx7.add(lreferred);
		bx7.add(referred);

		Box bx8 = Box.createHorizontalBox();
		bx8.add(exit);
		bx8.add(enter);
		// END PANEL CREATION

		frame.getContentPane().setLayout(new BoxLayout(frame.getContentPane(), BoxLayout.Y_AXIS));
		frame.getContentPane().add(bx1);
		frame.getContentPane().add(bx2);
		frame.getContentPane().add(bx3);
		frame.getContentPane().add(bx4);
		frame.getContentPane().add(bx5);
		frame.getContentPane().add(bx6);
		frame.getContentPane().add(bx7);
		frame.getContentPane().add(bx8);
		frame.pack();
		frame.setVisible(true);

	}

	private static class ExitListener implements ActionListener { // to MainPanel
		public void actionPerformed(ActionEvent e) {
			nextPanel(first, last, recid);
		}
	}

	private static class EnterListener implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			String tfname, tlname, sdate, edate, tdob, tplatend, ttrainer, treferred;
			Connection conn = null;
			int membid;

			tfname = fname.getText();
			tlname = lname.getText();
			tdob = dob.getText();

			// determines if optional columns are filled
			if (platend.getText().trim().isEmpty())
				tplatend = "null";
			else
				tplatend = "'" + platend.getText() + "'"; // surrounds with ' ' if there are values, otherwise
														  // the null values are later entered without them
			if (trainer.getText().trim().isEmpty())
				ttrainer = "null";
			else
				ttrainer = trainer.getText();

			if (referred.getText().trim().isEmpty())
				treferred = "null";
			else
				treferred = referred.getText();

			// current date
			sdate = LocalDate.now().toString();

			// checks radio buttons for membership length
			if (onemon.isSelected())
				edate = LocalDate.now().plusMonths(1).toString();
			else if (threemon.isSelected())
				edate = LocalDate.now().plusMonths(3).toString();
			else if (sixmon.isSelected())
				edate = LocalDate.now().plusMonths(6).toString();
			else
				edate = LocalDate.now().plusYears(1).toString();

			// executes query
			try {
				conn = DriverManager.getConnection(url);
				Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				Statement wstmt = conn.createStatement();

				String SQL = "SELECT memberid FROM member";
				ResultSet rs = stmt.executeQuery(SQL);
				rs.last();
				membid = rs.getInt("memberid") + 1;

				SQL = "INSERT INTO member VALUES (" + membid + ", '" + tfname + "', '" + tlname + "', '" + sdate
						+ "', '" + edate + "', '" + tdob + "', " + tplatend + ", " + ttrainer + ", " + treferred + ")";

				System.out.println(SQL);
				wstmt.execute(SQL);
				JOptionPane.showMessageDialog(null, "Member successfully enrolled.");

			} catch (SQLException e1) {
				e1.printStackTrace();
				JOptionPane.showMessageDialog(null,
						"There was an error enrolling the member.\nCheck for proper input and connection\nand try again.");
			}

		}
	}
}
