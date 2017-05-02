/// <reference path='../../../typings/hibachiTypescript.d.ts' />
/// <reference path='../../../typings/tsd.d.ts' />

class SWCardViewController {
    public cardTitle:string;
    public cardBody:string;
    public cardSize:string='md';
	//@ngInject
    constructor(private $log) {}

} 

class SWCardView implements ng.IComponentOptions {
    public controller:any=SWCardViewController;
    public controllerAs:string = 'SwCardViewController';
    public bindings = {
        cardTitle: "@?",
        cardBody: "@?",
        cardSize: "@?" //sm, md, lg
    };
    
    public transclude:any = {
        cardIcon: '?swCardIcon',
        cardHeader: '?swCardHeader',
        cardBody: '?swCardBody',
        listItem: '?swCardListItem',
        progressBar: '?swCardProgressBar'
    }

    public template:string = `
                
                <div class="s-{{(SwCardViewController.cardSize)}}-content-block{{(SwCardViewController.cardSize=='md'?'-inner':'')}}" style="margin-bottom:7px">
                    <!--- ICON --->
                    <ng-transclude ng-transclude-slot="cardIcon"></ng-transclude>
                    
                    <!-- TITLE -->
                    <!-- This when using attributes -->
                    <div class="s-title" ng-bind="SwCardViewController.cardTitle" ng-if="SwCardViewController.cardTitle"></div>
                    
                    <!-- This when transcluding the content in -->
                    <ng-transclude class="s-title" ng-transclude-slot="cardHeader"></ng-transclude>
                    
                    <!--- CONTENT --->
                    <!-- This when using attributes -->
                    <div class="s-body" ng-bind="SwCardViewController.cardBody" ng-if="SwCardViewController.cardBody"></div>
                    <!-- This when transcluding the content in -->
                    <ng-transclude ng-transclude-slot="cardBody"></ng-transclude>

                    <!--- LIST ITEMS --->
                    <ul class="list-unstyled">
                        <ng-transclude ng-transclude-slot="listItem"></ng-transclude>
                    </ul>

                    <!--- PROGRESS --->
                    <!-- This when transcluding the content in -->
                    <ng-transclude ng-transclude-slot="progressBar"></ng-transclude>


                </div>
           `;

    constructor() {  }
    
    /**
     * Handles injecting the partials path into this class
     */
    public static Factory(){
        return new SWCardView();
    }
}
export {SWCardViewController, SWCardView};