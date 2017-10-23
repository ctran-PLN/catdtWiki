Java:
//finding most common char in String
Arrays.stream("abcdeabcdabcaba".split("")).parallel()
				// get Map<String,Long> in element value and element counts
				.collect(Collectors.groupingBy(Function.identity(), Collectors.counting()))
				// process to Set<Entry<String, Long>>
				.entrySet()
				.stream()
				.max(	// Map.Entry comparators by delegating to another
					// comparator, exists also for keys
					 Map.Entry.comparingByValue(Long::compareTo)									
				)
				.ifPresent(e -> System.out.println(new StringBuilder()
									.append("Most common e is \'")
									.append( e.getKey())
									.append("\' with Frequencies: ")
									.append(e.getValue())));
			

// in case we have to manually serve static file to html, do this:
var jsFiles = ['jqueryLib.js','synonymFunctions.js'];
			for(var i in jsFiles){				
				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					  if (this.readyState == 4 && this.status == 200) {						  
						  var script_tag = document.createElement('script');
						  script_tag.type = 'text/javascript';
						  var text = JSON.parse(this.responseText);	
						  script_tag.text = unescape(text);
						  document.body.appendChild(script_tag);
						  $('#searchResult_btn').click();
					  }
				};
				xhttp.open("GET", "/discover/js/" + jsFiles[i], true);
				xhttp.send(); 
			}

@RequestMapping(value = "/js/{file}", method = { RequestMethod.GET})
	@ResponseBody
	public JsonNode getJsFile(@PathVariable("file") String fileName) throws IOException {				 
			String path = System.getProperty("user.dir").replace("/bin","") + "/webapps/discover/resources/js/" + fileName + ".js";
		    BufferedReader br = new BufferedReader(new InputStreamReader(
		    	    									new FileInputStream(path), "UTF-8"));		    
		    StringBuilder stb = new StringBuilder();  
		      try {
		    	 String thisLine = null;
		         while ((thisLine = br.readLine()) != null) {
		        	 stb.append(thisLine);
		        	 stb.append(System.getProperty("line.separator"));
		         }       
		      } catch(Exception e) {
		         e.printStackTrace();
		      }
		      br.close();
		    return new ObjectMapper().valueToTree(stb.toString() );
	}
  
	
