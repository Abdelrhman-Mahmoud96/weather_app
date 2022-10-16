abstract class DomainMapper<T, Domain>{
  T fromDomain(Domain domain);
  Domain toDomain(T entity);
}