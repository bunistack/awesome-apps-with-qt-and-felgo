import QtQuick 2.12
import QtQuick.Controls 2.12
import AppUtil 1.0

import "../components"
import "../controls"
import "../models"

FelgoPage {
    id: root

    property real scrollPosition: 0

    Component.onCompleted: {
        sortFoodCategories();
    }

    Column{
        anchors.fill: parent

        ShadowedRectangle{
            id: header
            width: parent.width
            height: 60
            shadowEnabled: scrollPosition > 0 && !navigationDrawer.opened
            z: 5

            Row {
                width: childrenRect.width
                height: parent.height
                spacing: 15
                leftPadding: 10

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

        SwipeView{
            id: swipeView
            width: parent.width
            height: parent.height - header.height

            Repeater{
                model: foodCategories

                FoodCategoryList{
                    foodsModel: foods
                    categoryName: category
                }
            }
        }
    }

    ListModel{
        id: foodCategories
    }

    FoodsListModel{
        id: foodsListModel
    }

    function sortFoodCategories(){

        let categories = {};

        for(let i=0; i<foodsListModel.count; i++){

            let food = foodsListModel.get(i);

            if(categories.hasOwnProperty(food.category)){
                categories[food.category].push(food);
            }else{
                categories[food.category] = [];
                categories[food.category].push(food);
            }
        }

        for(const category in categories){

            let foodCategory = {
                category: category,
                foods: categories[category]
            }

            foodCategories.append(foodCategory)

        }
    }

    // end of root
}
