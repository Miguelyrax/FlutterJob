

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:master_jobz/helpers/environment.dart';
import 'package:http/http.dart' as http;
import 'package:master_jobz/models/job.dart';
import 'package:master_jobz/models/job_response.dart';
import 'package:master_jobz/models/jobs_response.dart';
import 'package:master_jobz/models/requerimiento.dart';
import 'package:master_jobz/models/requerimiento_response.dart';
import 'package:master_jobz/models/requisito.dart';
import 'package:master_jobz/models/requisito_response.dart';
import 'package:master_jobz/peticiones/auth.dart';

class JobProvider with ChangeNotifier{
  List<Job> jobs = [];
  List<Job> empleos = [];
  Job? job;
  Color color1 = Colors.red;
  Color color2 = Colors.red;
   JobProvider(){
    print('---------hola----------');
    this.getEmpleos();
    this.getJobs();
  }
  cargarTodo(){
    this.getEmpleos();
    this.getJobs();
  }
  Future getJobs()async{
    print('---------hola----------');
    final url = Uri.parse('${Environment.baseURL}/jobs/');
    final String? token = await Auth.getToken();
    final resp = await  http.get(url, headers: {
      'Content-type':'application/json',
      'x-token': token.toString()
    });
    if(resp.statusCode == 200){
      final jobsResponse = jobsResponseFromJson(resp.body);
      jobs = jobsResponse.jobs;
      notifyListeners();
      return jobs;
    }
  }
  Future postular()async{
    final url = Uri.parse('${Environment.baseURL}/postulantes/${job!.id}');
    final String? token = await Auth.getToken();
    final resp = await  http.post(url, headers: {
      'Content-type':'application/json',
      'x-token': token.toString()
    });
  
    if(resp.statusCode == 200){
      
      return true;
    }
      return false;
  }
  Future getEmpleos()async{
    final url = Uri.parse('${Environment.baseURL}/jobs/empleos/');
    final String? token = await Auth.getToken();
    final resp = await  http.get(url, headers: {
      'Content-type':'application/json',
      'x-token': token.toString()
    });

    if(resp.statusCode == 200){
      final jobsResponse = jobsResponseFromJson(resp.body);
      empleos = jobsResponse.jobs;
      notifyListeners();
      return jobs;
    }
  }
  Future editJob(String title, String subTitle, String description, int totalRequerido, String id)async{
    final data = {
      "title":title,
      "subtitle":subTitle,
      "description":description,
      "totalRequerido":totalRequerido,
   
    };
    final url = Uri.parse('${Environment.baseURL}/jobs/$id');
    final String? token = await Auth.getToken();
    final resp = await  http.put(url, headers: {
      'Content-type':'application/json',
      'x-token': token.toString()
    },
    body:jsonEncode(data));

    if(resp.statusCode == 200){
      final jobsResponse = jobResponseFromJson(resp.body);
      job = jobsResponse.job;
      
      // jobs = jobs!.where((element)  element.id != job!.id).toList();
     
      // jobs = [...jobs!.map((element) => element.id != id ?element:jobsResponse.job)];
      int selector = jobs.indexWhere((element) => element.id == id);
      int index = empleos.indexWhere((element) => element.id == id);
      this.jobs[selector] = jobsResponse.job;
      this.empleos[index] = jobsResponse.job;
      // jobs![selector] = job!;
      
      
      notifyListeners();
      return true;
    }
    return false;
  }
  Future editStatus(String id, String status)async{
    final data = {
      "status":status,
    };
    final url = Uri.parse('${Environment.baseURL}/jobs/$id');
    final String? token = await Auth.getToken();
    final resp = await  http.put(url, headers: {
      'Content-type':'application/json',
      'x-token': token.toString()
    },
    body:jsonEncode(data));
 
    if(resp.statusCode == 200){
      final jobsResponse = jobResponseFromJson(resp.body);
      job = jobsResponse.job;
      

      // jobs = jobs!.where((element)  element.id != job!.id).toList();
      
      
      notifyListeners();
      return true;
    }
    return false;
  }
  Future getUltimosTres()async{
    final url = Uri.parse('${Environment.baseURL}/jobs/?limit=3');
    final String? token = await Auth.getToken();
    final resp = await  http.get(url, headers: {
      'Content-type':'application/json',
      'x-token': token.toString()
    });
    if(resp.statusCode == 200){
      final jobsResponse = jobsResponseFromJson(resp.body);
      jobs = jobsResponse.jobs;
      notifyListeners();
      return jobs;
    }
  }

  Future newJob(String title, String subTitle, String description, int totalRequerido)async{
    final data = {
      "title":title,
      "subtitle":subTitle,
      "description":description,
      "totalRequerido":totalRequerido
    };
    final String? token = await Auth.getToken();
    final url = Uri.parse('${Environment.baseURL}/jobs/');
    final resp = await http.post(url, headers: {
      'Content-type': 'application/json',
      'x-token': token.toString()
    },
    body: jsonEncode(data)
    );

    if(resp.statusCode == 200){
      final jobResponse = jobResponseFromJson(resp.body);
      final job = jobResponse.job;
      this.job = job;
      this.jobs.add(jobResponse.job);
      this.empleos.add(jobResponse.job);
      
      notifyListeners();
      return true;
    }
    return false;

  }

  Future newRequerimiento(String id, String title)async{
    final data = {
      "title":title
    };
    final url = Uri.parse('${Environment.baseURL}/requerimiento/$id');
    final String? token = await Auth.getToken();
    final resp =await  http.post(url, headers: {
      'Content-type':'application/json',
      'x-token': token.toString()
    },
    body: jsonEncode(data));

    if(resp.statusCode == 200){
      
      final requisitosResponse = requerimientoResponseFromJson(resp.body);
      
      job!.requerimientos.add(requisitosResponse.requerimiento);
      notifyListeners();
       return true;
    }
    return false;
  }
  Future editRequerimiento(String id, String title)async{
    final data = {
      "title":title
    };
    final url = Uri.parse('${Environment.baseURL}/requerimiento/$id');
    final String? token = await Auth.getToken();
    final resp =await  http.put(url, headers: {
      'Content-type':'application/json',
      'x-token': token.toString()
    },
    body: jsonEncode(data));
    
    if(resp.statusCode == 200){
      
      final requisitosResponse = requerimientoResponseFromJson(resp.body);
      job!.requerimientos.firstWhere((element) => element.id == requisitosResponse.requerimiento.id).title = requisitosResponse.requerimiento.title;
      notifyListeners();
       return true;
    }
    return false;
  }
  Future deleteRequerimiento(String id)async{
    final url = Uri.parse('${Environment.baseURL}/requerimiento/$id');
    final String? token = await Auth.getToken();
    final resp =await  http.delete(url, headers: {
      'Content-type':'application/json',
      'x-token': token.toString()
    });

    if(resp.statusCode == 200){

      job!.requerimientos.removeWhere((element) => element.id == id);
      notifyListeners();
       return true;
    }
    return false;
  }
  Future newRequisito(String id, String requisito)async{
    final data = {
      "requisito":requisito
    };
    final url = Uri.parse('${Environment.baseURL}/requisito/$id');
    final String? token = await Auth.getToken();
    final resp =await  http.post(url, headers: {
      'Content-type':'application/json',
      'x-token': token.toString()
    },
    body: jsonEncode(data));
    
    if(resp.statusCode == 200){
      
      final requisitosResponse = requisitoResponseFromJson(resp.body);
      Requisito req = requisitosResponse.requisito;
      
      job!.requerimientos.firstWhere((element) => element.id == req.idRequerimiento ).requisitos.add(req);
      notifyListeners();
       return true;
    }
    return false;
  }
  Future editRequisito(String id, String requisito)async{
    final data = {
      "requisito":requisito
    };
    final url = Uri.parse('${Environment.baseURL}/requisito/$id');
    final String? token = await Auth.getToken();
    final resp =await  http.put(url, headers: {
      'Content-type':'application/json',
      'x-token': token.toString()
    },
    body: jsonEncode(data));
 
    if(resp.statusCode == 200){
      
      final requisitosResponse = requisitoResponseFromJson(resp.body);
      Requisito req = requisitosResponse.requisito;
      
      job!.requerimientos.firstWhere((element) => element.id == req.idRequerimiento ).requisitos.firstWhere((element) => element.id == req.id).requisito = req.requisito;
      notifyListeners();
       return true;
    }
    return false;
  }
  Future deleteRequisito(String id, String reqId)async{
    final url = Uri.parse('${Environment.baseURL}/requisito/$id');
    final String? token = await Auth.getToken();
    final resp =await  http.delete(url, headers: {
      'Content-type':'application/json',
      'x-token': token.toString()
    });
 
    if(resp.statusCode == 200){
      
      job!.requerimientos.firstWhere((element) => element.id == reqId ).requisitos.removeWhere((element) => element.id == id) ;
      job!.requerimientos.firstWhere((element) => element.id == reqId ).requisitos.forEach((element) {
        print(element.requisito);
       });
      notifyListeners();
       return true;
    }
    return false;
  }

   bool getTotal(){
     int total = 0;
     int calificacion = 0;
     List<Requerimiento> requerimientos = job!.requerimientos;
     requerimientos.forEach((element) {
       total++;
       if(element.suma == 100){
         calificacion++;
         
       }
     });
      
     
     if(total == calificacion && total !=0 && calificacion != 0 ){
       notifyListeners();
       return true;
     }else{
       notifyListeners();
       return false;
     }
  }

}