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
			
