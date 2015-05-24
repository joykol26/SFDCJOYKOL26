trigger ImageIDUpdate on Attachment (after insert) {
  List<Attachment> img_id = [select id, name from Attachment where ParentId =: Trigger.New[0].ParentId];
  List<Position__c> pos_img=new List<Position__c>();
  pos_img=[select ImageID__c from position__c where Id =: Trigger.New[0].ParentId];
                        if(img_id.size()>0)
                        {
                                //    co[0].Attachment__c = true;
                                  //  update co;
                                  
                                  Id imgid=img_id[0].id;
                                  System.debug('image id====='+imgid);
                                  pos_img[0].ImageID__c=imgid;
                                  
                                  update pos_img;
                       }   
}