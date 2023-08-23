package org.cunoc;

import picocli.CommandLine;

import java.io.File;
import java.io.StringReader;
import java.nio.file.Files;
import java.util.Scanner;
import java.util.concurrent.Callable;

/**
 * Hello world!
 *
 */
@CommandLine.Command(name = "ThreeWayCode", mixinStandardHelpOptions = true, version = "0.0.1",
        description = "Assignment of values to a variable using arithmetic operations. Example: x = 1 + 1;")
public class App implements Callable<Integer>
{
    @CommandLine.Option(names = {"-f","--file"}, description = "File to read", required = false)
    private File file;

    @Override
    public Integer call() throws Exception{
        if(file != null) {
            MyParser parser = new MyParser(new MyLexer(Files.newBufferedReader(file.toPath())));
            System.out.println(parser.parse().value);
        } else {
            Scanner scanner = new Scanner(System.in);
            String input = "";
            while (!input.equalsIgnoreCase("exit")) {
                System.out.println("Ingrese exit para finalizar");
                System.out.print("Ingrese cadena para analizar > ");
                input = scanner.nextLine();
                if(input.equals("exit")) {
                    break;
                }
                MyLexer lexer = new MyLexer(new StringReader(input));
                MyParser parser = new MyParser(lexer);
                parser.parse();
                for (String tmp: parser.codeLines  ) {
                    System.out.println(tmp);
                }
            }
        }
        return 0;
    }

    public static void main( String[] args )
    {
        int exitCode = new CommandLine(new App()).execute(args);
        System.exit(exitCode);
    }
}
