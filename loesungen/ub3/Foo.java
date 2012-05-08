public class Foo
{
	public static void main(String[] args)
	{
		String[] names = { "Länge", "Winkel", "Imaginärteil", "Realteil" };
		String[] svals = { "abs", "angle", "imag", "real" };
		double[] vals = { 0.0001, 0.001, 0.01, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6,
				0.7, 0.8, 0.9, 0.99, 0.999, 0.9999 };

		for (int i = 0; i < 4; i++) {
			String s = svals[i];
			String name = names[i];
			System.out.println("\\begin{figure}[h]");
			for (int k = 0; k < vals.length; k++) {
				double v = vals[k];
				String vtext = String.format("%f", v);
				String lyxdottext = vtext.replaceAll("\\.", "\\\\lyxdot");
				String text = String
						.format("\\subfloat[%s]{\\includegraphics[width=0.19\\textwidth]{../lena/lena-low-%s-%s}}",
								vtext, s, lyxdottext);
				System.out.println(text);
				if (k != 0 && ((k + 1) % 5) == 0) {
					System.out.println("\\\\");
				}
			}
			System.out.println("\\caption{" + name + "}");
			System.out.println("\\end{figure}");
			System.out.println();
		}
	}
}
