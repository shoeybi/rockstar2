import numpy as np
from random import choice
from random import randrange


def Hits(rows):
    users = []
    index = {}
    k = 0
    for row in rows:
        #for i in range(2):
        if row.giver not in users:
            users.append(row.giver)
            index[row.giver] = k    
            #print "user ", k, " is ", row[i]
            k = k+1
        if row.receiver not in users:
            users.append(row.receiver)
            index[row.receiver] = k
            #print "user ", k, " is ", row[i]                                  
            k = k+1

    A = np.empty((k, k))
    A.fill(0)

    for row in rows:
        j = index[row.giver]
        i = index[row.receiver]
        #print row.giver
        #print row.awadedstars
        A[i,j] = A[i,j] +int( row.awadedstars)   

    for i in range(k):
        A[i,i]=0

    print A
    colRes = np.empty(k);
    colRes.fill(100)
    for col in range(k):
        for i in range(k):
            colRes[col] = colRes[col] - A[i,col]

    for col in range(k):
        t = colRes[col]/(k-1)
        for i in range(k):
            if i != col:
               #t=0
                A[i,col] = A[i,col] + t


    # print "____Graph Matrix____"
    # print A

    tol = 0.001;
    h = np.random.uniform(0, 1, size=k)
    a = np.random.uniform(0, 1, size=k)
    normh = 100
    norma = 100

    while ((normh>tol) & (norma>tol)):
        hn = h
        an = a
        h = A.dot(a)
        h = h/max(h)
        a = (A.T).dot(h)
        a = a/max(a)
        normh = (np.sum(abs(h-hn)))
        norma = (np.sum(abs(a-an)))
    #print normh, norma

    sort_ind =  np.argsort(-h)
    #finalRank = {}
    finalRank = []    

    #print "____Final Ranking____"
    for i in sort_ind:
        finalRank.append(users[i])
        #print users[i],"\t", h[i]
        #finalRank[users[i]] = h[i]

    return finalRank
#print "          ."


