package quiz;

public class SpellEx {

    public static void main(String[] args) {
        Spell[] mege = new Spell[3]; 
        
           mege[0] = new Fire();
           mege[1] = new Light();
           mege[2] = new Ice();

        for (int i = 0; i < mege.length; i++) {
            System.out.println(mege[i].casting());
        }
    }
}