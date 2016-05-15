package analisadorSintatico;

import java.io.IOException;

import java_cup.internal_error;

public class GeradorSintatico {

	public static void main(String[] args) throws internal_error, IOException, Exception {
		java_cup.Main.main(new String []{"-parser", "AnalisadorSintatico", "-interface", "-symbols", "Symbols",
				"-destdir", "src/analisadorSintatico", "-expect", "1000", "src/analisadorSintatico/EspecificacaoSintatica.cup"});
				
		}

	}


