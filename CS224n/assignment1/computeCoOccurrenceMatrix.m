function [M, word2Ind] = computeCoOccurrenceMatrix(corpus, window_size)
  [words, num_words, text_words] = distinctWords(corpus);
  
  M = zeros(num_words);
  d = {};
  
  for j = 1:length(text_words)
    word = text_words(j,:);
    
    r = j-window_size:j+window_size;
    r(r==j) = [];
    r(r<1) = [];
    
    setfield(d, word, text_words(r, :))
  endfor
  
  disp(d);
end