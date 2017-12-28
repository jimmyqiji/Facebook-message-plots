if(!exists("word.count", mode="function")) source("word count.R")


# initial
# end
# final
# step



wordCountByDate <- function (table){
  wordCountByDateHelper(as.character(table$Date), table$Message)
}


wordCountByDateHelper <- function(dates,messages){
  dateloop(dates, messages, dates[1], 1, 0, length(dates), numeric(0), numeric(0))
}



dateloop <- function(dates, messages, initday, cursor, words, len, days, totalcount){
  
  if (cursor > len){ # IF DONE SUMMARIZE PREV DAY AND OUTPUT
    
    Date = append(days, initday)
    Words = append(totalcount, words)
    
    # print(daysfin)
    # print(countsfin)
    
    return(data.frame(Date, Words))
  }
  
  else if (dates[cursor] != initday) { #DAY CHANGE, SUMMARIZE PREV DAY
    # print(initday)
    dateloop(dates, 
             messages, 
             dates[cursor], 
             cursor, 
             0, 
             len, 
             append(days, initday),
             append(totalcount, words)
    )
    
    # print(days)
    # print(totalcount)
  }
  else{ # NO DAY CHANGE, KEEP COUNTING
    wordcount <- word.count(messages[cursor])
    dateloop(dates, 
              messages, 
              initday,
              cursor+1,
              words+wordcount,
              len,
              days,
              totalcount)
    # print(initday)
    # print(days)
    # print(totalcount)
  }
}