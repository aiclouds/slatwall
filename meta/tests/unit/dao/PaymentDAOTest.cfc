/*

    Slatwall - An Open Source eCommerce Platform
    Copyright (C) ten24, LLC
	
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
	
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
	
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    Linking this program statically or dynamically with other modules is
    making a combined work based on this program.  Thus, the terms and
    conditions of the GNU General Public License cover the whole
    combination.
	
    As a special exception, the copyright holders of this program give you
    permission to combine this program with independent modules and your 
    custom code, regardless of the license terms of these independent
    modules, and to copy and distribute the resulting program under terms 
    of your choice, provided that you follow these specific guidelines: 

	- You also meet the terms and conditions of the license of each 
	  independent module 
	- You must not alter the default display of the Slatwall name or logo from  
	  any part of the application 
	- Your custom code must not alter or create any files inside Slatwall, 
	  except in the following directories:
		/integrationServices/

	You may copy and distribute the modified version of this program that meets 
	the above guidelines as a combined work under the terms of GPL for this program, 
	provided that you include the source code of that other code when and as the 
	GNU GPL requires distribution of source code.
    
    If you modify this program, you may extend this exception to your version 
    of the program, but you are not obligated to do so.

Notes:

*/
component extends="Slatwall.meta.tests.unit.SlatwallDAOTestBase" {
	
	public void function setUp() {
		super.setup();
		
		variables.dao = request.slatwallScope.getDAO("paymentDAO");
	}
	
	/**
	* @test
	*/
	public void function inst_ok() {
		assert(isObject(variables.dao));
	}
	
	/**
	* @test
	*/
	public void function getOriginalAuthorizationCode_returns_empty_string_using_orderPaymentID() {
		assert(variables.dao.getOriginalAuthorizationCode( orderPaymentID="this-is-fake" ) eq "");
	}
		
	/**
	* @test
	*/
	public void function getOriginalAuthorizationCode_returns_empty_string_using_orderPaymentID_and_referencedOrderPaymentID() {
		assert(variables.dao.getOriginalAuthorizationCode( orderPaymentID="this-is-fake", referencedOrderPaymentID="this-too-is-fake" ) eq "");
	}
		
	/**
	* @test
	*/
	public void function getOriginalAuthorizationCode_returns_empty_string_using_accountPaymentID() {
		assert(variables.dao.getOriginalAuthorizationCode( accountPaymentID="this-is-fake" ) eq "");
	}
	
	/**
	* @test
	*/
	public void function getOriginalAuthorizationProviderTransactionID_returns_empty_string_using_orderPaymentID() {
		assert(variables.dao.getOriginalAuthorizationProviderTransactionID( orderPaymentID="this-is-fake" ) eq "");
	}
		
	/**
	* @test
	*/
	public void function getOriginalAuthorizationProviderTransactionID_returns_empty_string_using_orderPaymentID_and_referencedOrderPaymentID() {
		assert(variables.dao.getOriginalAuthorizationProviderTransactionID( orderPaymentID="this-is-fake", referencedOrderPaymentID="this-too-is-fake" ) eq "");
	}
		
	/**
	* @test
	*/
	public void function getOriginalAuthorizationProviderTransactionID_returns_empty_string_using_accountPaymentID() {
		assert(variables.dao.getOriginalAuthorizationProviderTransactionID( accountPaymentID="this-is-fake" ) eq "");
	}
	
	/**
	* @test
	*/
	public void function getOriginalChargeProviderTransactionID_returns_empty_string_using_orderPaymentID() {
		assert(variables.dao.getOriginalChargeProviderTransactionID( orderPaymentID="this-is-fake" ) eq "");
	}
		
	/**
	* @test
	*/
	public void function getOriginalChargeProviderTransactionID_returns_empty_string_using_orderPaymentID_and_referencedOrderPaymentID() {
		assert(variables.dao.getOriginalChargeProviderTransactionID( orderPaymentID="this-is-fake", referencedOrderPaymentID="this-too-is-fake" ) eq "");
	}
		
	/**
	* @test
	*/
	public void function getOriginalChargeProviderTransactionID_returns_empty_string_using_accountPaymentID() {
		assert(variables.dao.getOriginalChargeProviderTransactionID( accountPaymentID="this-is-fake" ) eq "");
	}
	
	/**
	* @test
	*/
	public void function getOriginalProviderTransactionID_returns_empty_string_using_orderPaymentID() {
		assert(variables.dao.getOriginalProviderTransactionID( orderPaymentID="this-is-fake" ) eq "");
	}
		
	/**
	* @test
	*/
	public void function getOriginalProviderTransactionID_returns_empty_string_using_orderPaymentID_and_referencedOrderPaymentID() {
		assert(variables.dao.getOriginalProviderTransactionID( orderPaymentID="this-is-fake", referencedOrderPaymentID="this-too-is-fake" ) eq "");
	}
		
	/**
	* @test
	*/
	public void function getOriginalProviderTransactionID_returns_empty_string_using_accountPaymentID() {
		assert(variables.dao.getOriginalProviderTransactionID( accountPaymentID="this-is-fake" ) eq "");
	}
	
//	public void function updateInvalidAuthorizationCode_fails_if_only_authorization_code_is_passed() {
//		expectException("org.hibernate.hql.ast.QuerySyntaxException");
//		variables.dao.updateInvalidAuthorizationCode( authorizationCode="this-is-fake" );
//	}
		
	/**
	* @test
	*/
	public void function updateInvalidAuthorizationCode_runs_if_orderPaymentID_is_passed() {
		variables.dao.updateInvalidAuthorizationCode( authorizationCode="this-is-fake", orderPaymentID="this-is-fake" );
	}
		
	/**
	* @test
	*/
	public void function updateInvalidAuthorizationCode_runs_if_accountPaymentID_is_passed() {
		variables.dao.updateInvalidAuthorizationCode( authorizationCode="this-is-fake", accountPaymentID="this-is-fake" );
	}
}


