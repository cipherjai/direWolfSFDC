public class StringArrayTest {
    
    public static List<String> generateStringArray(Integer lengthOfArray){
        List <String> results = new List<String>();
        for(Integer iter = 0; iter < lengthOfArray; iter++)
        {
            results.add('Test ' + String.valueOf(iter));
        }        
        return results;
    }
}