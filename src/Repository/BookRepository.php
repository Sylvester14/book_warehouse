<?php

namespace App\Repository;

use App\Entity\Book;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Book>
 */
class BookRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Book::class);
    }

    /**
     * @return array<Book>
     */
    public function findBooksForShowcase(array $bookIds, array $authorIds, array $storeIds): array
    {
        $qb = $this->createQueryBuilder('b')
            ->leftJoin('b.authors', 'a')
            ->leftJoin('b.stores', 's')
            ->addSelect('a', 's');

        $or = $qb->expr()->orX();

        if (!empty($bookIds)) {
            $or->add($qb->expr()->in('b.id', ':bookIds'));
            $qb->setParameter('bookIds', $bookIds);
        }

        if (!empty($authorIds)) {
            $or->add($qb->expr()->in('a.id', ':authorIds'));
            $qb->setParameter('authorIds', $authorIds);
        }

        if (!empty($storeIds)) {
            $or->add($qb->expr()->in('s.id', ':storeIds'));
            $qb->setParameter('storeIds', $storeIds);
        }

        $qb->where($or);

        return $qb->getQuery()->getResult();
    }

    //    /**
    //     * @return Book[] Returns an array of Book objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('b')
    //            ->andWhere('b.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('b.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?Book
    //    {
    //        return $this->createQueryBuilder('b')
    //            ->andWhere('b.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
