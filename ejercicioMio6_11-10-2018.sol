pragma solidity ^0.4.19;

/**
 * The tk contract does this and that...
 */
contract dEvents {

  address public creadorEvento; // msg.sender u otro
  uint public valorEntradas = 10 finney; // 0.01 ETH
  uint public numeroEntradas = 9999; // 9999 entradas disponibles.
  uint public contadorEntradas = 1337; // El ID de la primera entrada será el 1337
  string public nombreEvento = "3era junta EthereumChile"; // nombre del evento
  bool estadoVenta = true; // El contrato se inicia vendiendo entradas

  struct Entrada { // La estructura de cada entrada
  	address addressComprador; // cuenta ethereum del comprador
  	bytes32 rut; // rut comprador
  	uint entradasCompradas; // cuantas entradas compró
  }

  mapping(uint => Entrada) public entradas;

  modifier soloCreador {
    require(msg.sender == creadorEvento);
    _;
  }
  
  constructor () public {
	creadorEvento = msg.sender; // el creador del evento es quién publica el contrato. 
  }

  function comprarEntrada(uint numeroEntradasComprar, bytes32 rut) public payable {
	require(msg.value == (numeroEntradasComprar * valorEntradas) && numeroEntradas != 0 && numeroEntradas >= numeroEntradasComprar && numeroEntradasComprar != 0 && rut[0] != 0 && estadoVenta);
	entradas[contadorEntradas].addressComprador = msg.sender; // address;
	entradas[contadorEntradas].entradasCompradas = numeroEntradasComprar; // uint;
	entradas[contadorEntradas].rut = rut; // bytes32;
	numeroEntradas = numeroEntradas - numeroEntradasComprar;
	contadorEntradas++;
	if(numeroEntradas == numeroEntradasComprar)
		estadoVenta = false;    
  }

  function verEntrada(uint id) public constant returns (bytes32, uint) {
	return (entradas[id].rut, entradas[id].entradasCompradas);
  }

  function cambiarEstado() public soloCreador {
	estadoVenta = !estadoVenta;
  }

  function retirarETH(uint monto) public soloCreador {
	creadorEvento.transfer(monto);
  }

}


// https://www.adictosaltrabajo.com/tutoriales/contratos-inteligentes-en-ethereum/
// https://ethereumchile.cl/2018/08/11/tutorial-dapp-venta-de-entradas-devents/