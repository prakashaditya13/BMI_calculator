
import 'dart:math';
class calculate{

  calculate({this.height,this.weight});

  final int height;
  final int weight;
  double _bmi;
  String bmicalculate(){
     _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String resultbmi(){
    if(_bmi >= 25){
      return 'OverWeight';
    }else if(_bmi > 18.5){
      return 'Normal';
    }else{
      return 'UnderWeight';
    }
  }
  String getInterportation(){
    if(_bmi >= 25){
      return 'You have higher than the normal body weight, Try to exercise more';
    }else if(_bmi > 18.5){
      return 'You have normal body weight, Good job';
    }else{
      return 'You have lower than the normal body weight, Try to eat more';
    }
  }
}