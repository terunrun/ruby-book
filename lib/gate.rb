class Gate

  STATIONS = [:umeda, :juso, :mikuni]
  FARES    = [150, 190]

  def initialize(name)
    @name = name
  end

  def enter(ticket)
    # 乗車駅を記録しておく
    ticket.stamp(@name)
  end

  def exit(ticket)
    fare = calc_fare(ticket)
    # ticketのもつ運賃が乗降車駅から算出した運賃以上かどうか
    fare <= ticket.fare
  end

  def calc_fare(ticket)
    from = STATIONS.index(ticket.stampted_at)
    to = STATIONS.index(@name)
    distance = to - from
    FARES[distance - 1]
  end
end
