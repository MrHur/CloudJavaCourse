package quiz;

public class Light extends Spell {
	@Override
	public String casting() {
		return "빛 " + super.casting();
	}
}
