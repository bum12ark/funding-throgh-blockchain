package blockchain;

import java.io.Serializable;

public class Input implements Serializable {
	private static final long serialVersionUID = 6021425960481155928L;
	public String outputId;
	public Output UTXO;
	
	public Input(String outputId) {
		this.outputId = outputId;
	}
}
