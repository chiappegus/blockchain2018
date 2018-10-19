
pragma solidity ^0.4.19;

/**
 * The contratoTickets contract does this and that...
 */
contract contratoTickets {
  
  // incompleto pedir !!!!
	struct ClassEventos {
			mapping (address => uint256) map1;
			mapping (address => uint256) map2;
			uint cantidad;
			string web;
			string data;
			
		}
	constrctor(){
		owner=msg.sender;
	}
   ClassEventos[] evento;
   address owner;



	function LennarInfo (uint _id , uint _cantidad , string _web ,string data) returns(bool res) internal {
		
		require (msg.sender == owner , "No estas autorizado");
		evento[_id].cantidad = _cantidad;
		evento[_id].web = _web;
		evento[_id].data= _data;

		
	}
	

	function comprarTickects (uint _id , uint _idTickect)  payable returns(bool res) internal {
		
		require (msg.value== 1 ether);

		require (_idTickect <= evento[__idTickect].cantidad , "es Tickect no exite");
		require (evento[__idTickect].map2[<= evento[__idTickect].cantidad , "es Tickect no exite");
		
		
	}

	function reembolsar () returns(bool res) internal {
		msg.sender.transfer(1 ether);
	}
	
	

}
