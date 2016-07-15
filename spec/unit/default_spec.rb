describe 'RainbowWrapper First level' do
  describe 'Second level' do
    context 'Third level' do
      it 'prints test output in default color' do
        puts 'some test code'
      end
      it { raise '' }
      context 'Fourth level' do
        context 'Fifth level' do
          context 'Sixth level' do
            it 'defaults to white output' do
              puts 'at high levels'
            end
            context 'Seventh level' do
              context 'Eigth levels' do
                it 'finally' do
                  puts ':)'
                end
                xit 'Not ready yet' do
                end
                it 'fails here' do
                  raise 'did something wrong'
                end
                context '9 levels' do
                  context '10 levels' do
                    context '11 levels' do
                      context '12 levels' do
                        context '13 levels' do
                          context '14 levels' do
                            context '15 levels' do
                              it 'cycles through colours' do
                                puts 'at high levels'
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
