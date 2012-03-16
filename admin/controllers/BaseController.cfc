/*

    Slatwall - An e-commerce plugin for Mura CMS
    Copyright (C) 2011 ten24, LLC

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
    
    Linking this library statically or dynamically with other modules is
    making a combined work based on this library.  Thus, the terms and
    conditions of the GNU General Public License cover the whole
    combination.
 
    As a special exception, the copyright holders of this library give you
    permission to link this library with independent modules to produce an
    executable, regardless of the license terms of these independent
    modules, and to copy and distribute the resulting executable under
    terms of your choice, provided that you also meet, for each linked
    independent module, the terms and conditions of the license of that
    module.  An independent module is a module which is not derived from
    or based on this library.  If you modify this library, you may extend
    this exception to your version of the library, but you are not
    obligated to do so.  If you do not wish to do so, delete this
    exception statement from your version.

Notes:

*/
component persistent="false" accessors="true" output="false" extends="Slatwall.com.utility.BaseObject" {
	
	property name="fw" type="any";
	property name="integrationService" type="any";
	
	public any function init(required any fw) {
		setFW(arguments.fw);
		
		return super.init();
	}
	
	public void function subSystemBefore(required struct rc) {
		
		// If user is not logged in redirect to front end otherwise If the user does not have access to this, then display a page that shows "No Access"
		if (!structKeyExists(session, "mura") || !len(rc.$.currentUser().getMemberships())) {
			if(left(rc.$.siteConfig().getLoginURL(), 1) eq "/") {
				location(url=rc.$.siteConfig().getLoginURL(), addtoken=false);
			} else {
				location(url="/#rc.$.siteConfig().getLoginURL()#", addtoken=false);	
			}
		} else if( getFW().secureDisplay(rc.slatAction) == false ) {
			getFW().setView("admin:main.noaccess");
		}
		
		// Check to see if any message keys were passed via the URL
		if(structKeyExists(rc, "messageKeys")) {
			var messageKeys = listToArray(rc.messageKeys);
			for(var i=1; i<=arrayLen(messageKeys); i++) {
				showMessageKey(messageKeys[i]);
			}
		}
		
		var itemCoreName = listLast(rc.slatAction, ".");
		var currentActionType = "";
		
		if(left(itemCoreName, 4) == "list") {
			itemCoreName = right(itemCoreName, len(itemCoreName)-4);
			currentActionType = "list";
		} else if (left(itemCoreName, 4) == "edit") {
			itemCoreName = right(itemCoreName, len(itemCoreName)-4);
			currentActionType = "edit";
		} else if (left(itemCoreName, 4) == "save") {
			itemCoreName = right(itemCoreName, len(itemCoreName)-4);
			currentActionType = "save";
		} else if (left(itemCoreName, 6) == "detail") {
			itemCoreName = right(itemCoreName, len(itemCoreName)-6);
			currentActionType = "detail";
		} else if (left(itemCoreName, 6) == "create") {
			itemCoreName = right(itemCoreName, len(itemCoreName)-6);
			currentActionType = "create";
		}
		
		rc.listAction = "admin:#getFW().getSection(rc.slatAction)#.list#itemCoreName#"; 
		rc.saveAction = "admin:#getFW().getSection(rc.slatAction)#.save#itemCoreName#";
		rc.detailAction = "admin:#getFW().getSection(rc.slatAction)#.detail#itemCoreName#";		
		rc.deleteAction = "admin:#getFW().getSection(rc.slatAction)#.delete#itemCoreName#";
		rc.editAction = "admin:#getFW().getSection(rc.slatAction)#.edit#itemCoreName#";
		rc.createAction = "admin:#getFW().getSection(rc.slatAction)#.create#itemCoreName#";
		
		if(currentActionType eq "edit") {
			rc.cancelAction = "admin:#getFW().getSection(rc.slatAction)#.detail#itemCoreName#";	
		} else {
			rc.cancelAction = "admin:#getFW().getSection(rc.slatAction)#.list#itemCoreName#";
		}
	}
	
	private void function showMessageKey(required any messageKey) {
		showMessage(message=rbKey(arguments.messageKey), messageType=listLast(messageKey, "_"));
	}
	
	private void function showMessage(string message="", string messageType="info") {
		if(!structKeyExists(request.context, "messages")) {
			request.context.messages = [];
		}
		arrayAppend(request.context.messages, arguments);
	}
	
	

}
