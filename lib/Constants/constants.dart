import 'package:docs_app/models/treatment_slides.dart';

class Constants{

  static final String SPLASH_SCREEN='SPLASH_SCREEN';

  static final String AEO_DOCS='AEO_DOCS';

  static List<TreatmentsSlides> getTreatmentsSlides(){

    return [
      new TreatmentsSlides('LOSE 5Kg in 1 MONTH','assets/images/wight_plan.jpg','Goal Oriented Clinically Proven Personalized Paln','KNOW MORE'),
      new TreatmentsSlides('LOSE 5Kg in 1 MONTH','assets/images/consult.jpg','Goal Oriented Clinically Proven Personalized Paln','TAKE TEST'),
      new TreatmentsSlides('LOSE 5Kg in 1 MONTH','assets/images/refer_earn.jpeg','Goal Oriented Clinically Proven Personalized Paln','REFER NOW'),
      new TreatmentsSlides('LOSE 5Kg in 1 MONTH','assets/images/doctors.jpg','Goal Oriented Clinically Proven Personalized Paln','CONSULT NOW'),
      new TreatmentsSlides('LOSE 5Kg in 1 MONTH','assets/images/lab_test.jpg','Goal Oriented Clinically Proven Personalized Paln','LAB TEST'),
    ];

  }
}