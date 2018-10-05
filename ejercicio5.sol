pragma solidity ^0.4.25;

/**
 * The test01 contract does this and that...
 */

 
 
contract test01 {

	mapping (address => uint) plata; //cantidad de plata
	mapping (address => address) destino; // a al direccion
    address Owner1;
    address Owner2;
    address Owner3;
    address[] Menbers;

	constructor () {
	/* Owner1=0xca35b7d915458ef540ade6068dfe2f44e8fa733c;

	Owner2=0x14723a09acff6d2a60dcdf7aa4aff308fddc160c;
	Owner3=0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db; */

	Owner =msg.sender;

	}

	function addMenbers (address _address) {

		
		
	}
	

	function recibirDinero () public payable{

		require (msg.value ==Owner3 || msg.value ==Owner2 || msg.value ==Owner1 ,

			"Solo los dueños pueden enviar");
		
			
		}

    function solicitar (address _destino , uint256 _plata) public {

    	require (msg.value ==Owner3 || msg.value ==Owner2 || msg.value ==Owner1 ,

			"Solo los dueños pueden autorizar");
		require (address(this).balance>=plata[msg.sender]);
           destino[msg.sender] = _destino;
           plata[msg.sender] = _plata;

           if (destino[Owner1] == destino[Owner2] && destino[Owner2] == destino[Owner3]){
            if (plata[Owner1] == plata[Owner2] && plata[Owner2] == plata[Owner3]){
                 
                 
                 
                 destino[Owner2].transfer(plata[Owner2]);
            }
           }

    			
    		}

			
}

