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
<link href="/discover/resources/synonym.css" rel="stylesheet">
<script src="/discover/resources/jqueryLib.js" ></script>
<script src="/discover/resources/synonymFunctions.js" ></script>

@RequestMapping(value = "/resources/{file}", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public byte[] getStaticFile(@PathVariable("file") String fileName) throws IOException {				 
		String path = System.getProperty("user.dir").replace("/bin","") + "/webapps/discover/resources/" + fileName;
		InputStream in = new FileInputStream(new File(path));
		return IOUtils.toByteArray(in);	
	}
  
	
