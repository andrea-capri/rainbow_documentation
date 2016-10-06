describe 'RainbowWrapper First level' do
  describe 'Second level' do
    context 'Third level' do
      context 'Fourth level' do
        context 'Fifth level' do
          context 'Sixth level' do
            context 'Seventh level' do
              context 'Eigth levels' do
                context '9 levels' do
                  context '10 levels' do
                    context '11 levels' do
                      context '12 levels' do
                        context '13 levels' do
                          context '14 levels' do
                            context '15 levels' do
                              it 'cycles through colours' do
                                'at high levels'
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
    describe 'example failed, pending, passed and stdout prints' do
      context 'passed' do
        it 'Success' do
          ':)'
        end
      end
      context 'not passed' do
        xit 'Not ready yet' do
          puts 'hi'
        end
        it 'fails here' do
          puts 'debug output'
          raise 'did something wrong'
        end
      end
      context 'pending tests' do
        pending 'not yet implemented'
      end
    end
  end
end
