defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

    @doc ""
      Counts individual nucleotides in a DNA strand.
      
        ## Examples
        
          iex> DNA.count('AATAA', ?A)
            4
            
              iex> DNA.count('AATAA', ?T)
                1
                  ""
                    @spec count([char], char) :: non_neg_integer
                      def count(strand, nucleotide) when nucleotide in @nucleotides do
                          Map.get(
                                histogram(strand),
                                      nucleotide,
                                            0
                                                )
                            end
                            
                              def count(_strand, _nucleotide) do
                                  raise ArgumentError
                                    end
                                    
                                    
                                      @doc ""
                                        Returns a summary of counts by nucleotide.
                                        
                                          ## Examples
                                          
                                            iex> DNA.histogram('AATAA')
                                              %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
                                                ""
                                                  @spec histogram([char]) :: map
                                                    def histogram(strand) do
                                                    
                                                        initial = %{?A => 0, ?T => 0, ?C => 0, ?G => 0}
                                                        
                                                            List.foldl(strand, initial, fn (letter, acc) ->
                                                                  update_map(letter, acc)
                                                                      end)
                                                              end
                                                              
                                                                defp update_map(letter, map) when letter in @nucleotides do
                                                                    Map.update(map, letter, 1, &(&1 + 1))
                                                                      end
                                                                      
                                                                        defp update_map(_letter, _map) do
                                                                            raise ArgumentError
                                                                              end
                                                                              end"
