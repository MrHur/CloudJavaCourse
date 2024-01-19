package quiz;

public class Fire extends Spell {
	@Override
	public String casting() {
		return "화염 " + super.casting();
	}

}