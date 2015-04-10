/**
 * Created by Alfred on 4/9/2015.
 */
import util.TextLineNumber;
import javax.swing.*;
import javax.swing.filechooser.FileNameExtensionFilter;
import java.awt.*;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.io.*;
import java.util.ArrayList;

public class Starter extends JFrame {

    JButton open;
    JButton save;
    JTextArea input;
    JTextArea output;

    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            @Override
            public void run() {
                Starter starter = new Starter();
                starter.setVisible(true);
            }
        });
    }

    public Starter(){
        init();
    }

    public void init(){
        setTitle("Starter");
        setSize(640, 480);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        add(buttonPanel(), BorderLayout.PAGE_START);

        add(textPanel(), BorderLayout.CENTER);
    }

    public void decode(ArrayList<String> inputArrayList){

    }

    public JPanel buttonPanel(){
        JPanel outer = new JPanel();
        outer.setLayout(new GridLayout(1,2,5,5));

        JPanel leftPanel = new JPanel();
        JPanel rightPanel = new JPanel();
        leftPanel.setLayout(new FlowLayout(FlowLayout.LEFT));
        rightPanel.setLayout(new FlowLayout(FlowLayout.RIGHT));

        open = new JButton();
        open.setText("Open");
        open.addActionListener(new ActionListener() {

            public void actionPerformed(ActionEvent e) {
                //Execute when button is pressed
                process();
                System.out.println("Open button clicked");
            }
        });

        leftPanel.add(open);

        save = new JButton();
        save.setText("Save");
        save.setEnabled(false);
        save.addActionListener(new ActionListener() {

            public void actionPerformed(ActionEvent e) {
                //Execute when button is pressed
                System.out.println("Save button clicked");
                saveFile();
            }
        });
        rightPanel.add(save);

        outer.add(leftPanel);
        outer.add(rightPanel);
        return outer;
    }

    public JPanel textPanel() {
        JPanel panel = new JPanel();
        panel.setLayout(new GridLayout(1, 2, 5, 5));
        panel.add(inputArea());
        panel.add(outputArea());
        return panel;
    }
    public JPanel inputArea() {
        JPanel panel = new JPanel();
        panel.setLayout(new BorderLayout());

        JLabel inputLabel = new JLabel();
        inputLabel.setText("Input:");

        input = new JTextArea(10, 20);
        input.setEnabled(false);
        input.setLineWrap(true);
        input.setWrapStyleWord(true);

        JScrollPane scrollPane = new JScrollPane(input);
        TextLineNumber textLineNumber = new TextLineNumber(input);
        scrollPane.setRowHeaderView(textLineNumber);

        panel.add(inputLabel, BorderLayout.NORTH);
        panel.add(scrollPane, BorderLayout.CENTER);
        return panel;
    }

    public JPanel outputArea() {
        JPanel panel = new JPanel();
        panel.setLayout(new BorderLayout());

        JLabel outputLabel = new JLabel();
        outputLabel.setText("Output:");

        output = new JTextArea(10, 20);
        output.setEnabled(false);
        output.setLineWrap(true);
        output.setWrapStyleWord(true);

        JScrollPane scrollPane = new JScrollPane(output);
        TextLineNumber textLineNumber = new TextLineNumber(output);
        scrollPane.setRowHeaderView(textLineNumber);

        panel.add(outputLabel, BorderLayout.NORTH);
        panel.add(scrollPane, BorderLayout.CENTER);
        return panel;
    }

    public void process(){
        File file = getFile();
        ArrayList<String> input = readFile(file);

        updateInput(input);
        decode(input);
        displayAndSave(input);
    }

    public void displayAndSave(ArrayList<String> output) {
        updateOutput(output);
        save.setEnabled(true);
    }

    public void updateInput(ArrayList<String> inputArrayList) {
        input.setText(null);
        for (String line : inputArrayList) {
            input.append(line);
            input.append("\n");
        }
    }

    public void updateOutput(ArrayList<String> outputArrayList) {
        output.setText(null);
        for (String line : outputArrayList) {
            output.append(line);
            output.append("\n");
        }
    }

    public File getFile(){
        JFileChooser chooser = new JFileChooser();
        FileNameExtensionFilter filter = new FileNameExtensionFilter(
                "Text files", "txt");
        chooser.setFileFilter(filter);
        File workingDirectory = new File(System.getProperty("user.dir"));
        chooser.setCurrentDirectory(workingDirectory);
        Component parent = new JOptionPane();
        int returnVal = chooser.showOpenDialog(parent);
        if(returnVal == JFileChooser.APPROVE_OPTION) {
            System.out.println("You chose to open this file: " +
                    chooser.getSelectedFile().getName());
        }
        return chooser.getSelectedFile();
    }

    public ArrayList<String> readFile(File file) {
        try {
            FileInputStream fileInputStream = new FileInputStream(file);
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(fileInputStream));
            ArrayList input = new ArrayList<String>();
            String line = null;
            while((line = bufferedReader.readLine()) != null) {
                input.add(line);
            }
            return input;
        } catch (FileNotFoundException e) {
            System.out.println("Problem reading file.");
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void saveFile(){
        File file = getFile();

        FileWriter fw = null;
        try {
            fw = new FileWriter(file.getAbsoluteFile(), true);
            output.write(fw);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}