public class Main {  
	public static void main(String args[]) {
		int n = 1;
		int sum = -1;
		while (true) {
			sum = sum(n);
			System.out.printf("1+2+3+...+%d = %d\n", n, sum);
			n += 1;
		}
        }

	private static int sum(final int n) {
		int sum = 0;
		for (int i = 0; i < n; ++i) {
			sum += i;
		}
		return sum;
	}
}

