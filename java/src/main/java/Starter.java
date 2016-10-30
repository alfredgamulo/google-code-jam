/**
 * Created by Alfred on 4/9/2015.
 */

import util.TextLineNumber;

import javax.swing.*;
import javax.swing.filechooser.FileNameExtensionFilter;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.*;
import java.util.ArrayList;
import java.util.Collections;

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

    public void process(){
        File file = getFile();
        ArrayList<String> input = readFile(file);

        updateInput(input);
        ArrayList<String> output = makeitdo(input);
        displayAndSave(output);
    }

    public ArrayList<String> makeitdo(ArrayList<String> inputArrayList) {
        ArrayList<String> output = new ArrayList<>();

        int t = Integer.parseInt(inputArrayList.remove(0));

        while(t > 0) {
            System.out.println("Trial: " + t);
            int m = 0;
            int D = Integer.parseInt(inputArrayList.remove(0));
            String[] line = inputArrayList.remove(0).split(" ");
            ArrayList<Integer> P = new ArrayList<Integer>(line.length);
            for (int i = 0; i < line.length; i++) {
                P.add(Integer.parseInt(line[i]));
            }

            Collections.sort(P);

            int sum = P.stream().mapToInt(Integer::intValue).sum();

            int mode = findMode(P);


            do {
                int p = P.remove(P.size() - 1);
                p = p / 2 + p % 2;
                P.add(p);
                P.add(p);
                Collections.sort(P);
                m++;
            }while (P.get(P.size() - 1) > mode);

            int newMode = findMode(P);
//            if (P.get(P.size() - 1) > newMode) {
//                m += P.get(P.size() - 1);
//            } else {
//                m += newMode;
//            }
            m += newMode;

            output.add(mode+" " + newMode +" "+P.get(P.size() - 1) +" "+m);
            t--;
        }


        return output;
    }

    public int findMode(ArrayList<Integer> list) {
        int maxValue = -1;
        int maxCount = 0;
        for(int i = 0; i < list.size(); i++) {
            // count number of times nums[i] is in array
            int count = 0;
            for(int j = 0; j < list.size(); j++) {
                if(list.get(j) == list.get(i)) {
                    count++;
                }
            }

            // remember the highest count we have seen
            if(count >= maxCount) {
                maxValue = list.get(i);
                maxCount = count;
            }
        }
        if (maxCount == 1) {
//            if (list.size() == 1) {
//                return list.get(0);
//            } else {
//                return list.get(list.size() - 2);
//            }
            return list.get(list.size() - 1);
        }
        return maxValue;
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

    public void displayAndSave(ArrayList<String> output) {
        updateOutput(output);
        save.setEnabled(true);
    }

    public void updateInput(ArrayList<String> inputArrayList) {
        input.setText(null);
        StringBuilder sb = new StringBuilder();
        for (String line : inputArrayList) {
            sb.append(line);
            sb.append("\n");
        }
        sb.setLength(sb.length()-1);
        input.append(sb.toString());
    }

    public void updateOutput(ArrayList<String> outputArrayList) {
        output.setText(null);
        StringBuilder sb = new StringBuilder();
        int index = 0;
        for (String line : outputArrayList) {
            sb.append("Case #" + ++index + ": " + line);
            sb.append("\n");
        }
        sb.setLength(sb.length() - 1);
        output.append(sb.toString());
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
            System.out.println(input);
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
            fw = new FileWriter(file.getAbsoluteFile(), false);
            output.write(fw);
            fw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}