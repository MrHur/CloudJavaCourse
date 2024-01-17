package quiz;

public class SingletonEx {

	public static class Singleton {
		private int number;
		private static Singleton instance;

        private Singleton() {
            // private 생성자로 외부에서 직접 생성을 막음
        }
        
		private int getNumber() {
			return number;
		}

		
		public void setNumber(int number) {
			this.number = number;
		}

		public static Singleton getInstance() {
            if (instance == null) {
                instance = new Singleton();
            }
            return instance;
		}
	}

	public static void main(String[] args) {
		Singleton s = Singleton.getInstance();

		s.setNumber(100);
		System.out.println(s.getNumber());

	}
}
