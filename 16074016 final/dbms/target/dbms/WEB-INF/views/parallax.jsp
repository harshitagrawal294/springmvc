

<div class="block">
  <img src="https://unsplash.it/1920/1920/?image=1005" data-speed="-1" class="img-parallax">
  <h2>Parallax Speed -1</h2>
</div>
<div class="block">
  <img src="https://unsplash.it/1920/1920/?image=1067" data-speed="1" class="img-parallax">
  <h2>Parallax Speed 1</h2>
</div>
<div class="block">
  <img src="https://unsplash.it/1920/1920/?gravity=center" data-speed="-0.25" class="img-parallax">
  <h2>Parallax Speed -0.25</h2>
</div>
<div class="block">
  <img src="https://unsplash.it/1920/1920/?image=1080" data-speed="0.25" class="img-parallax">
  <h2>Parallax Speed 0.25</h2>
</div>
<div class="block">
  <img src="https://unsplash.it/1920/1920/?random" data-speed="-0.75" class="img-parallax">
  <h2>Parallax Speed -0.75</h2>
</div>
<div class="block">
  <img src="https://unsplash.it/1920/1920/?blur" data-speed="0.75" class="img-parallax">
  <h2>Parallax Speed 0.75</h2>
</div>

<dependency>
	<groupId>org.springframework</groupId>
	<artifactId>spring-tx</artifactId>
	<version>${spring-framework.version}</version>
</dependency>


<tx:annotation-driven proxy-target-class="true"
		transaction-manager="transactionManager" />


	<bean id="transactionManager"
		class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
		<property name="dataSource" ref="dataSource" />
	</bean>
	
