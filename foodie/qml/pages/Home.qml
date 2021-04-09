import QtQuick 2.12
import AppUtil 1.0

import "../components"
import "../controls"
import "../models"

FelgoPage {
    id: root

    Component.onCompleted: {
        generatePopularFoods();
    }

    onAppeared: {
        mainAppWindow.showCartButton = true;
    }

    Column{
        anchors.fill: parent

        ShadowedRectangle{
            id: header
            width: parent.width
            height: 60
            shadowEnabled: scrollView.position > 0 && !navigationDrawer.opened
            z: 5

            Row {
                width: childrenRect.width
                height: parent.height
                spacing: 15
                leftPadding: 20

                Image {
                    width: 30
                    height: 30
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/assets/images/icons/hamburger_menu_grey.png"

                    MouseArea{
                        anchors.fill: parent
                        onClicked: navigationDrawer.open()
                    }
                }

                // end of first row
            }
        }

        CustomScrollView {
            id: scrollView
            width: parent.width
            height: parent.height - header.height
            clip: true
            contentWidth: -1

            Flow{
                width: parent.width
                height: childrenRect.height
                topPadding: 20
                bottomPadding: 20
                spacing: 20

                onWidthChanged: {

                    let cols = Math.floor(width/360);

                    if(cols < 2){
                        leftPadding = (width-320)/2 < 10 ? 10 : (width-320)/2;
                        return;
                    }

                    leftPadding = (width - ((320*cols) + ((cols-1)*spacing)))/2;

                }

                // home
                Item {
                    width: parent.width - (parent.leftPadding * 2)
                    height: 35

                    Text {
                        width: contentWidth
                        height: parent.height
                        text: "Home"
                        font.family: AppUtil.font1.name
                        font.pixelSize: 23
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                    }
                }


                // categories
                Item {
                    width: parent.width - (parent.leftPadding * 2)
                    height: 35

                    Text {
                        width: contentWidth
                        height: parent.height
                        text: "Categories"
                        font.family: AppUtil.font1.name
                        font.pixelSize: 18
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                ListView{
                    width: parent.width - (parent.leftPadding * 2)
                    height: 140
                    spacing: 20
                    orientation: ListView.Horizontal
                    model: CategoriesModel{}

                    delegate: CategoryListCard{

                    }
                }

                // popular
                Item {
                    width: parent.width - (parent.leftPadding * 2)
                    height: 35

                    Text {
                        width: contentWidth
                        height: parent.height
                        text: "Popular"
                        font.family: AppUtil.font1.name
                        font.pixelSize: 18
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                Repeater{
                    model: popularFoods

                    FoodListCard{

                    }
                }

                // end of flow
            }

            // end of CustomScrollView
        }

        // end of Column
    }

    ListModel{
        id: popularFoods
    }

    FoodsListModel{
        id: foodsListModel
    }

    Connections{
        target: navigationDrawer

        onMenuItemClicked: {

            switch(index){
            case 0:
                root.navigationStack.popAllExceptFirst();
                break;
            case 1:
                root.navigationStack.popAllExceptFirstAndPush(Qt.resolvedUrl("Foods.qml"));
                break;
            case 2:
                root.navigationStack.popAllExceptFirstAndPush(Qt.resolvedUrl("Cart.qml"));
                break;
            default:
                break;
            }
        }
    }

    function generatePopularFoods(){

        let popularFoodsIndexes = [];

        while(true){

            let index = AppUtil.randomInteger(foodsListModel.count);

            if(popularFoodsIndexes.includes(index)){
                continue;
            }

            popularFoodsIndexes.push(index);

            let food = foodsListModel.get(index);

            popularFoods.append(food);

            if(popularFoods.count >= 5){
                break;
            }

        }

    }

    // end of root
}
