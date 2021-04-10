import Felgo 3.0
import QtQuick 2.12
import AppUtil 1.0

import "./components"
import "./controls"

App {
    id: mainAppWindow
    height: 600
    width: 900
    opacity: 0
    color: AppUtil.themeColor

    property bool showCartButton: false

    property int totalCartQuantity: 0
    property real subTotal: 0
    property real vat: 0.16 * subTotal
    property real cartTotal: subTotal + vat

    onSplashScreenFinished: {
        mainNavigationStack.push(Qt.resolvedUrl("./pages/OnboardingScreen.qml"));
    }

    SplashScreen{
        mainWindow: mainAppWindow
    }        

    Rectangle{
        width: parent.width
        height: parent.height
        anchors.left: parent.left
        anchors.leftMargin: (navigationDrawer.position * navigationDrawer.width)
        transformOrigin: Item.Left
        scale: 1 - (navigationDrawer.position * 0.2)
        clip: true
        radius: navigationDrawer.position * 16

        Column{
            anchors.fill: parent
            anchors.margins: navigationDrawer.position * parent.radius

            // status bar
            Rectangle{
                id: appStatusBar
                width: parent.width
                height: AppUtil.isMobile() ? (visible ? AppUtil.statusBarHeight() : 0) : 0
                z: 20
            }

            // content
            Item {
                width: parent.width
                height: parent.height - appStatusBar.height

                FelgoNavigationStack{
                    id: mainNavigationStack
                    anchors.fill: parent
                }

                // cart action button
                CartButton{
                    visible: showCartButton
                }

            }

            // end of Column
        }

    }

    NavigationDrawer{
        id: navigationDrawer
    }

    ImageMessageDialog{
        id: imageMessageDialog
    }

    ListModel{
        id: cartListModel
    }

    function addToCart(food){

        let cartItem = existsInCart(food);

        if(cartItem === false){
            food['quantity'] = 1;
            cartListModel.append(food);
        }else{
            cartItem['quantity'] += 1;
        }

        computeTotalQuantity();

    }

    function removeFromCart(index){
        cartListModel.remove(index);
        computeTotalQuantity();
    }

    function clearCart(){
        cartListModel.clear();
        computeTotalQuantity();
    }

    function existsInCart(food){

        for(let i=0; i<cartListModel.count; i++){

            let cartItem = cartListModel.get(i);

            if(cartItem.name === food.name){
                return cartItem;
            }
        }

        return false;
    }

    function computeTotalQuantity(){

        totalCartQuantity = 0;
        subTotal = 0;

        for(let i=0; i<cartListModel.count; i++){

            let cartItem = cartListModel.get(i);

            totalCartQuantity += cartItem.quantity;
            subTotal += (cartItem.quantity * cartItem.price)
        }

    }

    // end of root
}
