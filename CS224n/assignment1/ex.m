clear ; close all; clc;

global START_TOKEN = '<START>';
global END_TOKEN = '<END>';

test_corpus = ["<START> All that glitters isn't gold <END>"; "<START> All's well that ends well too <END>"];

[M_test, word2Ind_test] = computeCoOccurrenceMatrix(cellstr(test_corpus), 1);