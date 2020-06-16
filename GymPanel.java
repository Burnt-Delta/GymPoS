// AUTHENTICATION PANEL
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;

public class GymPanel extends JPanel {
	private JLabel greeting;
	private JTextField entry;
	private ResultSet possible;
	private int recid = 0;
	private String url;

	public GymPanel(String u) {
		url = u;
		setLayout(new FlowLayout());
		greeting = new JLabel("Welcome! Please enter your RecID:");

		entry = new JTextField(3);
		entry.addActionListener(new EntryListener());

		add(greeting);
		add(entry);

		setPreferredSize(new Dimension(300, 50));
		setBackground(Color.gray);
	}

	private class EntryListener implements ActionListener { // a RecID is entered

		@Override
		public void actionPerformed(ActionEvent e) {
			int entryint, inst;
			String text = entry.getText();
			boolean isIt = false;
			Connection conn = null;

			entryint = Integer.parseInt(text);

			try {
				conn = DriverManager.getConnection(url);
				Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				String SQL = "SELECT * FROM receptionist";
				possible = stmt.executeQuery(SQL);
				isIt = false;

				// checks for a match
				while ((possible.next()) && (isIt == false)) {
					inst = possible.getInt("recid");
					if (entryint == inst) {
						recid = entryint;
						isIt = true;
					}
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}

			if (isIt == true) {

				try {
					// gets the full name from the successful recid match
					possible.previous();
					String fname = possible.getString("fname");
					String lname = possible.getString("lname");

					// proceeds to the main panel
					GymPOS.nextPanel(fname, lname, recid);

				} catch (SQLException e1) {
					e1.printStackTrace();
				}

			} else
				JOptionPane.showMessageDialog(null, "Invalid RecID");

			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}

		}

	}
}
