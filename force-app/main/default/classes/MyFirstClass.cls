public class MyFirstClass {
    public void myCoolMethod() {
        List<Account> accounts = [SELECT name FROM Account LIMIT 100];
        System.debug(accounts);
    }

    public void secondMethod() {
        // method
    }

    public void mySecondMehtod() {
        // method 2
    }
}