package extenso;

import java.util.HashMap;

public class NumberToText {
  private static HashMap hm;
  private static int number;

  private static void numberAnalizer() {
    String num = String.valueOf(number);
    int strSize = num.length();
    String[] decomposed = num.split("");
    System.out.println(decomposed[0]);
  }

  public static final String text(int number) {
    createMapNumbers();
    numberAnalizer();
    return "";
  }

  private static void createMapNumbers() {
    hm = new HashMap<String, String>();
    hm.put("1", "um");
    hm.put("2", "dois");
    hm.put("3", "tres");
    hm.put("4", "quatro");
    hm.put("5", "cinco");
    hm.put("6", "seis");
    hm.put("7", "sete");
    hm.put("8", "oito");
    hm.put("9", "nove");
    hm.put("10", "dez");
    hm.put("11", "onze");
    hm.put("12", "doze");
    hm.put("13", "treze");
    hm.put("14", "quatorze");
    hm.put("15", "quinze");
    hm.put("16", "dezesseis");
    hm.put("17", "dezessete");
    hm.put("18", "dezoito");
    hm.put("19", "dezenove");
    hm.put("2_", "vinte");
    hm.put("3_", "trinta");
    hm.put("4_", "");
    hm.put("5_", "um");
    hm.put("6_", "um");
    hm.put("7_", "um");
    hm.put("8_", "um");
    hm.put("9_", "um");
    hm.put("100", "cem");
    hm.put("1__", "cento");
    hm.put("2__", "duzentos");
    hm.put("3__", "trezentos");
    hm.put("4__", "quatrocentos");
    hm.put("5__", "quinhentos");
    hm.put("6__", "seiscentos");
    hm.put("7__", "setecentos");
    hm.put("8__", "oitocentos");
    hm.put("9__", "novecentos");
    hm.put("___", "mil");
    hm.put("1______", "milhão");
    hm.put("______", "milhões");
    hm.put("1_________", "Bilhão");
    hm.put("_________", "bilhões");
    hm.put("1____________", "trilhão");
    hm.put("____________", "trilhões");
  }

}
