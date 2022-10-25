class GetTime
  FORMAT = {year: '%Y', 
           month: '%m',
             day: '%d',
            hour: '%H',
          minute: '%M',
          second: '%S'}
  
  def initialize(req)
    @query = req.params['format'].split(',')
    @query_incorrect = []
    @query_correct = []
  end

  def call
    @query.each do |item|
      FORMAT[item.to_sym].nil? ? @query_incorrect << item : @query_correct << FORMAT[item.to_sym] 
    end
  end

  def success?
    @query_incorrect.empty?
  end

  def get_time
    Time.now.strftime(@query_correct.join('-'))
  end

  def get_incorrect
    "Unknown time format [#{@query_incorrect.join(',')}]"
  end

end