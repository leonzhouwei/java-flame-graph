import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class Main {

	private static final int N = 5_000_000;

	private boolean useArrayList = false;
	private List<String> list;

	public static void main(String args[]) {
		Main main = new Main(true);
		main.init();
		main.loop();
	}

	public Main() {
	}

	public Main(boolean useArrayList) {
		this.useArrayList = useArrayList;
	}

	public void init() {
		if (useArrayList) {
			list = new ArrayList<String>(N);
		} else {
			list = new LinkedList<String>();
		}

		System.out.println("--- init started ...");
		for (int i = 0; i < N; ++i) {
			list.add(Integer.toString(i));
		}
		System.out.println("--- init done");
	}

	public void loop() {
		double rand;
		int i;
		while (true) {
			rand = Math.random();
			i = (int) (rand * N);
			System.out.printf("list[%d]=%s\n", i, list.get(i));
		}
	}

}

