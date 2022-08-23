package extenso;

import java.util.HashMap;

public class NumberToText {
  private HashMap hm;
  private int number;

  private void setNumber(int number) {
    this.number = number;
  }

  private void numberAnalyzer() {
    String num = String.valueOf(this.number);
    int strSize = num.length();
    char[] decomposed = num.toCharArray();
    StringBuilder analyzed = new StringBuilder();
    for (int i = 0; i < decomposed.length; i++) {
      int digits = decomposed.length - i;
      StringBuilder hashText = new StringBuilder();
      hashText.append(Character.toString(decomposed[i]));
      for (int j = 0; j < digits - 1; j++) {
        hashText.append("_");
      }
      System.out.println(hashText.toString());
      analyzed.append(this.hm.get(hashText.toString()));
    }
    System.out.println(analyzed.toString());
  }

  public static final String text(int number) {
    NumberToText ntt = new NumberToText();
    ntt.setNumber(number);
    ntt.createMapNumbers();
    ntt.numberAnalyzer();
    return "";
  }

  private void createMapNumbers() {
    this.hm = new HashMap<String, String>();
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
    hm.put("4_", "quarenta");
    hm.put("5_", "cinquenta");
    hm.put("6_", "sessenta");
    hm.put("7_", "setenta");
    hm.put("8_", "oitenta");
    hm.put("9_", "noventa");
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
    hm.put("1_________", "bilhão");
    hm.put("_________", "bilhões");
    hm.put("1____________", "trilhão");
    hm.put("____________", "trilhões");
  }

}
