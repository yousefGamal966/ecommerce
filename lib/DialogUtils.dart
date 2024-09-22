import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading(BuildContext context,String message,{bool isCancelable =true}){
    showDialog(context: context, builder:(BuildContext){
      return AlertDialog(
        backgroundColor: Theme.of(context).canvasColor,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(message),
            Container(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(color: Theme.of(context).primaryColor,))
          ],
        ),
      );
    },
        barrierDismissible: isCancelable
    );
  }
  static void hideDialog(BuildContext context){
    Navigator.pop(context);
  }
  static void showMessage(BuildContext context,String message,{bool isCancelable =true,
    String? posActionTitle,String? negActionTitle,VoidCallback? posAction,VoidCallback? negAction }){
    List<Widget> actions = [];
    if(posActionTitle != null){
      actions.add(TextButton(onPressed: (){
        Navigator.pop(context);
        posAction?.call();
      },child:Text(posActionTitle) ,));
    }
    if(negActionTitle != null){
      actions.add(TextButton(onPressed: (){
        Navigator.pop(context);
        negAction?.call();
      },child:Text(negActionTitle,style: TextStyle(color: Colors.red),) ,));
    }
    showDialog(context: context, builder:(BuildContext){
      return AlertDialog(
        backgroundColor: Theme.of(context).canvasColor,
        actions: actions,
        content: Row(

          children: [
            Expanded(child: Text(message)),

          ],
        ),
      );
    },
        barrierDismissible: isCancelable
    );
  }

}