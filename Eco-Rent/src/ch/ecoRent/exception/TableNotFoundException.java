package ch.ecoRent.exception;

public class TableNotFoundException extends Exception {

    /**
     *
     */
    private static final long serialVersionUID = -3603033139102190960L;

    public TableNotFoundException() {
    }

    public TableNotFoundException(String msg) {
        super(msg);
    }
}

