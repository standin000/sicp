      product        counter------------------------- >
      |  |          ||             |                  |
      |  |--<-------|X +1          X counter<-t       n
      |  X *        |              | 
      ^  |          X t<-add       ^
      |  X t<-multi |              |
      |  |-------->-t--->----------| 
      |--<-------X--| 
                 product<-t

          start<----------------------|
            |                         | 
            > --yes-->done            |
            | no                      |
            *                         |
            |                         |
           t<-m                       |
            |                         ^
     product<-t                       |
            |                         |
            +1                        |
            |                         |
           t<-a                       |
            |                         |
     counter<-t--------->-------------
