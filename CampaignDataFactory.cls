public class CampaignDataFactory {
public static list<Campaign> getData(integer count)
{
    list<Campaign> lstCampaign = new list<Campaign>();
    for(integer index=0;index<count;index++)
    {
        Campaign objCamp = new Campaign();
        if(index<100)
        {
        objCamp.Name = 'abcd'+index;
        }
        else
        {
            objCamp.Name = 'abcd'+index;
            objCamp.ActualCost = 100000;
        }
        lstCampaign.add(objCamp);
    }
    
    return lstCampaign;
}
}