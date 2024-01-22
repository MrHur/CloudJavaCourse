package quiz;

public class Ice extends Spell {
	@Override
	public String casting() {
		return "얼음 " + super.casting();
	}
}
