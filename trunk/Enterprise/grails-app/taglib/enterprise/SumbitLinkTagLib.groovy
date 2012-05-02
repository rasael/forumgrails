package enterprise

class SumbitLinkTagLib {

    static namespace = "forum"
    
    def submitLink = {attrs ->
        def text = attrs.text
        def formName = attrs.formName
        
        out << createLink(text, formName)
    }
    
    def createLink(text, formName){
 
        StringBuilder sb = new StringBuilder()
 
        sb << """
           <a href="javascript:submitform_${formName}()">${text}</a>
           <script type="text/javascript">
           function submitform_${formName}()
           {
              document.${formName}.submit();
           }
           </script>
        """
        return sb.toString()
    }
}