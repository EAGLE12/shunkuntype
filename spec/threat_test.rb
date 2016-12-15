# coding: utf-8
require 'thread'

class TestThread
  max_cnt   = 2         # 同時に処理するスレッドの最大数
  obj_queue = Queue.new  # キューのインスタンス化

  # スレッドで処理
  ary_threads = []
  max_cnt.times do
    ary_threads << Thread.start do
      while !obj_queue.empty?
        var = obj_queue.pop
        t = rand(0)
        sleep t
        printf( "Thread %03d ( %10.8f ) \n", var, t )
      end
    end
  end

  # キュー
  ( 1..100 ).each do |i|
    obj_queue.push( i )
  end

  # スレッド完了待ち
  ary_threads.each { |th| th.join }
end