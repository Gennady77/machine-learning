function [corpus_words, num_corpus_words, corpus_text_words] = distinctWords(corpus)
  num_corpus_words = -1;
  corpus_words = cell();
  corpus_text_words = cell();
  
  for i=1:size(corpus,1)
    cp = corpus{i,:};
    k = 1;
    while ~isempty(cp)
      [str, cp] = strtok(cp, [' @$/#.-:&*+=[]?!(){}"_;%' char(10) char(13)]);
      str = regexprep(str, "[^a-zA-Zа-яА-я0-9'><]", '');
      corpus_text_words{i, k} = str;
      corpus_words{size(corpus_words,1)+1, 1} = str;
      k = k + 1;
    endwhile
  endfor
  
  corpus_words = unique(corpus_words);
  num_corpus_words = length(corpus_words);

  sort(corpus_words);
end