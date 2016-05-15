package analisadorLexico;
import analisadorSintatico.Symbols.java

%% 

%public
%class AnalisadorLexico
%unicode
%line
%column

%{
	private ComplexSymbolFactory symbolFactory;
	public Lexer (File file, ComplexSymbolFactory symbolFactory) throws IOException {
		this(new BufferedReader(new InputStreamReader(new FileInputStream(file))));
		this.sybolFactory = symbolFactory;
	}
}%

%eofval{
	return symbolFactory.newSymbol("EOF", EOF);
%eofval}


identificador = (_|[A-Za-z])(_|[A-Za-z]|[0-9])*
espaco = [ \n\t\r\f]
inteiro = 0|"-"?([1-9][0-9]*) 
"+" | "-" | "*" | "/" | "%" | "!" | "&&" | "||" | "==" | "!=" | "<" | "<=" | ">" | ">="
delimitadores = ";" | "." | "," | "(" | ")" | "{" | "}" | "[" | "]" | "=" 
palavreservadas = "public" | "class" | "extends" | "static" | "void" | "boolean" | "main" | "String" | "int" | "while" | "if" | "else" | "return" | "length" | "true" | "false" | "this" | "new" | "System.out.println"
comentarios = "//".|"/*"([^"*"]|[\r\n]|("*"+([^"*/"]|[\r\n])))*"*"+"/"

%%

{identificador} { return symbolFactory.newSymbol(yytext(), IDENTIFICADOR); }
{inteiro} { return symbolFactory.newSymbol(yytext(), NUMERO); }

"+" { return symbolFactory.newSymbol(yytext(), SOMA); }
{op} { return symbolFactory.newSymbol(yytext(), SUBTRACAO); }
{op} { return symbolFactory.newSymbol(yytext(), MULTIPLICACAO); }
{op} { return symbolFactory.newSymbol(yytext(), DIVISAO); }
{op} { return symbolFactory.newSymbol(yytext(), RESTO); }
{op} { return symbolFactory.newSymbol(yytext(), NEGACAO); }
{op} { return symbolFactory.newSymbol(yytext(), E); }
{op} { return symbolFactory.newSymbol(yytext(), OU); }
{op} { return symbolFactory.newSymbol(yytext(), IGUAL); }
{op} { return symbolFactory.newSymbol(yytext(), DIFERENTE); }
{op} { return symbolFactory.newSymbol(yytext(), MENOR); }
{op} { return symbolFactory.newSymbol(yytext(), MENORIGUAL); }
{op} { return symbolFactory.newSymbol(yytext(), MAIOR); }
{op} { return symbolFactory.newSymbol(yytext(), MAIORIGUAL); }

{delimitadores} { return symbolFactory.newSymbol(yytext(),  PONTOVIRGULA); }
{delimitadores} { return symbolFactory.newSymbol(yytext(),  PONTO); }
{delimitadores} { return symbolFactory.newSymbol(yytext(),  VIRGULA); }
{delimitadores} { return symbolFactory.newSymbol(yytext(),  ABREPAR); }
{delimitadores} { return symbolFactory.newSymbol(yytext(),  FECHAPAR); }
{delimitadores} { return symbolFactory.newSymbol(yytext(),  ABRECHAVES); }
{delimitadores} { return symbolFactory.newSymbol(yytext(),  FECHACHAVES); }
{delimitadores} { return symbolFactory.newSymbol(yytext(),  ABRECOL); }
{delimitadores} { return symbolFactory.newSymbol(yytext(),  FECHACOL); }
{delimitadores} { return symbolFactory.newSymbol(yytext(),  ATRIBUI); }

{palavreservadas} { return symbolFactory.newSymbol(yytext(),  PUBLIC); }
{palavreservadas} { return symbolFactory.newSymbol(yytext(),  CLASS); }
{palavreservadas} { return symbolFactory.newSymbol(yytext(),  EXTENDS); }
{palavreservadas} { return symbolFactory.newSymbol(yytext(),  STATIC); }
{palavreservadas} { return symbolFactory.newSymbol(yytext(),  VOID); }
{palavreservadas} { return symbolFactory.newSymbol(yytext(),  BOOLEAN); }
{palavreservadas} { return symbolFactory.newSymbol(yytext(),  MAIN); }
{palavreservadas} { return symbolFactory.newSymbol(yytext(),  STRING); }
{palavreservadas} { return symbolFactory.newSymbol(yytext(),  INT); }
{palavreservadas} { return symbolFactory.newSymbol(yytext(),  WHILE); }
{palavreservadas} { return symbolFactory.newSymbol(yytext(),  IF); }
{palavreservadas} { return symbolFactory.newSymbol(yytext(),  ELSE); }
{palavreservadas} { return symbolFactory.newSymbol(yytext(),  RETURN); }
{palavreservadas} { return symbolFactory.newSymbol(yytext(),  LENGTH); }
{palavreservadas} { return symbolFactory.newSymbol(yytext(),  THIS); }
{palavreservadas} { return symbolFactory.newSymbol(yytext(),  NEW); }
{palavreservadas} { return symbolFactory.newSymbol(yytext(),  SYSTEMOUTPRINTLN); }

{espaco} { }
{comentarios} { }

. { throw new RuntimeException("Caractere ilegal! '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }